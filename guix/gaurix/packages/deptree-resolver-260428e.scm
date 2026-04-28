;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428e
;;; Resolves 100 BLOCKED packages from priority queue.
;;; 5 ALREADY_RESOLVED (asp, aurutils, euroscope-bin, faustus-dkms-git,
;;;   fileoptimizer-bin) — recipes confirmed in existing imported modules.
;;; 4 newly categorized (pikaur-static, pikaur-static-git → DISTRO_SPECIFIC;
;;;   prey → NON_DISTRIBUTABLE; borgwarehouse → COMPLEX_DEPS).
;;; 91 remain BLOCKED with existing permanent fail reasons.
;;; 0 new recipes — all 100 packages are either already resolved
;;; or genuinely intractable.
;;; Generated: 2026-04-28
;;;
;;; Key findings: With only 177 BLOCKED packages remaining in the queue
;;; (down from 3,978 as of deptree-resolver-260428d), the remaining
;;; packages are almost entirely in permanently intractable categories:
;;; PROPRIETARY_BINARY (15), COMPLEX_DEPS (14), DKMS_KERNEL_MODULE (13),
;;; MINGW_CROSS_COMPILATION (10), DISTRO_SPECIFIC (11), PLATFORM_UNSUPPORTED (7),
;;; ABANDONED_UPSTREAM (6), ARCH_SPECIFIC (5), MULTILIB_UNSUPPORTED (6),
;;; NON_DISTRIBUTABLE (5), KERNEL_HEADERS (4), LEGACY_PYTHON2 (2),
;;; SELINUX_SPECIFIC (2), HARDWARE_SPECIFIC (1).
;;;
;;; This pass is a bookkeeping-only pass: no new define-public forms.

(define-module (gaurix packages deptree-resolver-260428e)
  #:use-module (guix packages))

;;; No new package definitions — see deptree-resolver-260428e-blocked-notes.scm
;;; for full disposition of all 100 evaluated packages.
