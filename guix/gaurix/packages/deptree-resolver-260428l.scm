;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428l
;;; 100 BLOCKED evaluated, 1 resolved to DONE, 0 new dependency packages.
;;; 1 recipe fix applied (intel-level-zero-raytracing-support-git):
;;;   - Switched from git-fetch to url-fetch (git-fetch fails in sandboxed builds)
;;;   - Added tbb input and -DZE_RAYTRACING_TBB=normal flag (prevents FetchContent)
;;;   - Build verified: guix build -L guix succeeds
;;; 2 newly classified: fcitx5-lotus-openrc-git, fcitx5-lotus-runit-git → DISTRO_SPECIFIC
;;; 97 confirmed BLOCKED (intractable categories from prior passes).
;;;
;;; Key findings this pass:
;;; - intel-level-zero-raytracing-support (#55356): ALREADY_RESOLVED as
;;;   intel-level-zero-raytracing-support-git in deptree-resolver-260417r.scm.
;;;   Recipe fixed: added TBB dep, corrected CMake flags, switched to url-fetch.
;;;   Build verified successful.
;;; - fcitx5-lotus-openrc-git: OpenRC init script for fcitx5-lotus. Guix uses
;;;   Shepherd, not OpenRC. DISTRO_SPECIFIC.
;;; - fcitx5-lotus-runit-git: runit service for fcitx5-lotus. Guix uses
;;;   Shepherd, not runit. DISTRO_SPECIFIC.
;;; - hnefatafl-copenhagen: Requires Rust >= 1.94 (edition 2024), Guix has 1.85.1.
;;; - borgwarehouse: Next.js app with 500+ npm deps, node-build-system infeasible.
;;; - All 97 previously classified packages remain intractable:
;;;   PROPRIETARY_BINARY (16), COMPLEX_DEPS (14), DKMS_KERNEL_MODULE (12),
;;;   DISTRO_SPECIFIC (10+2), MINGW_CROSS_COMPILATION (10), ABANDONED_UPSTREAM (6),
;;;   PLATFORM_UNSUPPORTED (5), ARCH_SPECIFIC (5), MULTILIB_UNSUPPORTED (5),
;;;   NON_DISTRIBUTABLE (5), KERNEL_HEADERS (4), SELINUX_SPECIFIC (2),
;;;   LEGACY_PYTHON2 (2), HARDWARE_SPECIFIC (1).
;;;
;;; Verification: upstream Guix checked for all 100 packages.
;;; Key deps still missing: Rust >= 1.94, .NET 9.0, Crystal, Zig 0.14,
;;;   Wayfire, Granite, mono-basic, fcitx5-lotus.
;;; Key deps available: level-zero 1.27.0, tbb 2021.6.0, mold 2.40.4,
;;;   wxwidgets 3.2.8.1, electron 36.8.1 (nonfree), node 22.14.0.
;;;
;;; See deptree-resolver-260428l-blocked-notes.scm for detailed evaluation.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428l))

;;; No new packages in this module.
;;; Recipe fix applied to deptree-resolver-260417r.scm:
;;;   intel-level-zero-raytracing-support-git — added tbb, TBB=normal flag,
;;;   switched to url-fetch, build verified.
