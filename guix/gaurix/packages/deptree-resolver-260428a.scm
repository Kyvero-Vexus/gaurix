;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428a
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 0 resolved (all 100 remain BLOCKED --- intractable categories).
;;; Generated: 2026-04-28
;;;
;;; All 100 selected packages have been evaluated across 20+ prior passes.
;;; Remaining blockers fall into genuinely intractable categories:
;;;   PROPRIETARY_BINARY (14), KERNEL_MODULE (10), DKMS_KERNEL_MODULE (4),
;;;   DISTRO_SPECIFIC (11), MINGW_CROSS (8), MULTILIB (5), PLATFORM (6),
;;;   COMPLEX_DEPS (11), ABANDONED (5), NON_DISTRIBUTABLE (4),
;;;   SELINUX (2), ARCH_SPECIFIC (4), LEGACY_PYTHON2 (2),
;;;   HARDWARE_SPECIFIC (1), SOURCE_UNAVAILABLE (3), KERNEL_HEADERS (1).
;;;
;;; No new recipes or dependencies to package.

(define-module (gaurix packages deptree-resolver-260428a)
  #:use-module (guix packages))

;;; This pass produced no new package definitions.
;;; All 100 evaluated BLOCKED packages remain blocked for reasons
;;; documented in deptree-resolver-260428a-blocked-notes.scm.
