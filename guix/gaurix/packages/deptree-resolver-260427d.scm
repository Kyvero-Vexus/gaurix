;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass — deptree-resolver-260427d
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 1 ALREADY_IN_GUIX (coreutils-arch), 0 new recipes, 99 remain BLOCKED.
;;; Generated: 2026-04-27

(define-module (gaurix packages deptree-resolver-260427d)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

;;; ====================================================================
;;; PASS SUMMARY — deptree-resolver-260427d
;;; ====================================================================
;;;
;;; 100 BLOCKED packages evaluated via dependency-tree priority order.
;;; All 191 remaining BLOCKED packages have been through 10-25+ resolver
;;; passes.  The residual consists entirely of:
;;;
;;;   - DKMS kernel modules (21 packages)
;;;   - MinGW-w64 cross-compilation (9 packages)
;;;   - Multilib/lib32 (5 packages)
;;;   - Distro-specific / Arch tools (14 packages)
;;;   - Proprietary/non-distributable (12 packages)
;;;   - Platform-unsupported (5 packages)
;;;   - Complex build chains (5 packages)
;;;   - Dep resolution failures (14 packages)
;;;   - Legacy/abandoned (5 packages)
;;;   - Source unavailable (9 packages)
;;;   - ALREADY_IN_GUIX (1 package: coreutils-arch)
;;;
;;; No new recipes were feasible this pass.
;;;
;;; Notable finding: wayprompt-git was previously blocked because
;;; "Zig compiler not in Guix" — but Zig 0.15.2 is now available.
;;; However, wayprompt still needs 6 unpackaged Zig library deps
;;; (zig-ini, zig-spoon, zig-fcft) plus older versions of
;;; zig-pixman, zig-wayland, zig-xkbcommon (v0.2.0 vs v0.3.0+).
;;; Updated blocking reason accordingly.
;;;
;;; ====================================================================
