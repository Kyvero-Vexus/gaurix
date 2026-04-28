;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Dependency-tree resolver pass --- deptree-resolver-260428m
;;; 100 BLOCKED evaluated, 1 resolved to DONE, 0 new dependency packages.
;;; boost-python2 (#37225): ALREADY_RESOLVED in deptree-resolver-260428d.
;;;   Header status updated from BLOCKED to DONE.
;;;
;;; 99 confirmed BLOCKED (intractable categories from prior passes):
;;;   PROPRIETARY_BINARY (17), DKMS_KERNEL_MODULE (12), DISTRO_SPECIFIC (12),
;;;   COMPLEX_DEPS (11), MINGW_CROSS_COMPILATION (10), SOURCE_UNAVAILABLE (6),
;;;   PLATFORM_UNSUPPORTED (5), ARCH_SPECIFIC (5), MULTILIB_UNSUPPORTED (5),
;;;   NON_DISTRIBUTABLE (5), ABANDONED_UPSTREAM (4), KERNEL_HEADERS (3),
;;;   SELINUX_SPECIFIC (2), HARDWARE_SPECIFIC (1).
;;;
;;; Key findings this pass:
;;; - boost-python2 (#37225): body shows DONE/ALREADY_RESOLVED from 260428d,
;;;   but header was still BLOCKED. Updated header to DONE.
;;; - All 99 blocked packages re-evaluated with 3+ approach attempts documented
;;;   in prior passes. Categories confirmed stable.
;;; - python-home-assistant-frontend: requires Python >= 3.14, 110MB pre-built JS blob.
;;; - rdt-client: binary .NET repackage but needs dotnet-runtime-9.0 (only 8.0 in nonguix).
;;; - phonon-qt4-vlc: Qt4 not in Guix; package abandoned 2020.
;;; - quartz-utils-git: Crystal language not available in Guix.
;;; - pikaur-static/pikaur-static-git: pacman/AUR wrapper, useless outside Arch.
;;; - mobirise: proprietary, no source code, custom license.
;;;
;;; Verification: AUR cache (110883 packages) and upstream Guix checked.
;;; Key deps still missing: Crystal, .NET 9.0, Mono, Qt4, Gradio,
;;;   mailnagger, Python >= 3.14.
;;;
;;; See deptree-resolver-260428m-blocked-notes.scm for detailed evaluation.
;;;
;;; Generated: 2026-04-28

(define-module (gaurix packages deptree-resolver-260428m))

;;; No new packages in this module.
;;; 1 status correction: boost-python2 header BLOCKED → DONE (already resolved
;;; in deptree-resolver-260428d).
