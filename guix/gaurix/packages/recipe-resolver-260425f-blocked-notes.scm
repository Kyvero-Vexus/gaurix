;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Blocked notes for recipe-resolver-260425f
;;; Timestamp: 2026-04-25T22:00:00+00:00
;;; 19 packages BLOCKED (81 recipes created from 100 attempted)
;;;

(define-module (gaurix packages recipe-resolver-260425f-blocked-notes)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:))

;;; --- TOOLING_FAILURE (3 packages) ---
;;; playerctld-systemd-unit: TOOLING_FAILURE: systemd user unit for playerctld; Guix uses shepherd, not systemd; next: skip -- not applicable to Guix init system
;;; findbrokenpkgs: TOOLING_FAILURE: Arch Linux specific tool for finding broken packages via shared library checks (revdep-rebuild port); next: skip -- not applicable to Guix
;;; borgwarehouse: TOOLING_FAILURE: Node.js web application with massive npm dependency tree (Next.js based); Guix node-build-system cannot resolve 500+ npm deps; next: would need npm lockfile vendoring approach

;;; --- DEP_RESOLUTION_FAILED (15 packages) ---
;;; qt6-xcb-private-headers-git: DEP_RESOLUTION_FAILED: requires Qt6 full build infrastructure and private header extraction; 50+ Qt6 build deps needed; next: package Qt6 xcb module headers separately
;;; faustus-dkms-git: DEP_RESOLUTION_FAILED: DKMS kernel module for ASUS laptops; requires kernel module build infrastructure not available in Guix channels; next: use linux-module-build-system with specific kernel
;;; ideapad-laptop-tb2024g6plus-dkms: DEP_RESOLUTION_FAILED: DKMS kernel module for ThinkBook 2024; requires kernel module build infrastructure; next: use linux-module-build-system
;;; ideapad-laptop-tb-dkms: DEP_RESOLUTION_FAILED: DKMS kernel module for ThinkBook; requires kernel module build infrastructure; next: use linux-module-build-system
;;; ghostty-git-zen3: DEP_RESOLUTION_FAILED: Zig-based terminal emulator with CPU-arch-specific optimizations; requires Zig compiler not available in Guix; next: wait for Zig to be packaged in Guix
;;; phonon-qt4-vlc: DEP_RESOLUTION_FAILED: Phonon VLC backend for Qt4; Qt4 is EOL and removed from Guix package set; next: skip -- Qt4 is dead upstream
;;; thunderbird-beta: DEP_RESOLUTION_FAILED: massive Mozilla build system with 100+ dependencies (Rust+LLVM+ICU+NSS+full graphics stack); next: use existing thunderbird package and add beta variant
;;; logstash: DEP_RESOLUTION_FAILED: complex JRuby/Java application with 200+ gem/jar dependencies and Elastic build pipeline; next: would need extensive Java dependency vendoring
;;; veloren: DEP_RESOLUTION_FAILED: massive Rust voxel game with 300+ crate dependencies; next: requires cargo vendor manifest with full crate dependency tree
;;; lobe-chat: DEP_RESOLUTION_FAILED: massive Next.js application with 500+ npm transitive dependencies; next: not feasible as Guix channel package
;;; webcord-vencord-git: DEP_RESOLUTION_FAILED: Electron Discord client with massive npm dependency tree; requires full Electron build infrastructure; next: consider binary packaging approach
;;; gephi-git: DEP_RESOLUTION_FAILED: Java/NetBeans platform graph visualization tool; complex build infrastructure with 100+ Java dependencies; next: would need extensive Java dep packaging
;;; mailspring: DEP_RESOLUTION_FAILED: Electron email client with massive npm dependency tree and C++ native modules; next: consider binary .deb repackaging
;;; bililive-recorder: DEP_RESOLUTION_FAILED: .NET application requiring .NET SDK/runtime build infrastructure not in Guix; next: wait for .NET SDK to be packaged in Guix
;;; ultrastardx-git: DEP_RESOLUTION_FAILED: Free Pascal karaoke game; requires Free Pascal Compiler (fpc) not available in Guix; next: wait for fpc to be packaged in Guix

;;; --- SOURCE_UNAVAILABLE (0 packages) ---
;;; (none)

;;; --- LICENSE_REVIEW_NEEDED (0 packages) ---
;;; (none)

;;; --- NEEDS_RECIPE_DESIGN (1 package) ---
;;; emmet-language-server: NEEDS_RECIPE_DESIGN: Node.js language server with npm dependency tree; node-build-system requires explicit npm deps; next: enumerate npm transitive dependencies for manual packaging
