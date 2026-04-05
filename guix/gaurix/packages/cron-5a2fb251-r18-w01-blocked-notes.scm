;;; Blocked packages from r18-w01 batch with detailed notes.
(define-module (gaurix packages cron-5a2fb251-r18-w01-blocked-notes)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:))

;;; ────────────────────────────────────────────
;;; localsend — BLOCKED: MISSING_GUIX_DEPS
;;; ────────────────────────────────────────────
;;; Source build of LocalSend requires Flutter/FVM/Dart toolchain which
;;; does not exist in Guix.  The AUR PKGBUILD uses fvm (Flutter Version
;;; Manager) to build a Flutter app with Rust components.
;;; Approaches tried:
;;;   1. Checked for flutter, fvm, dart packages in Guix — none found.
;;;   2. Considered using pre-built Flutter SDK — Guix's reproducibility
;;;      model makes this impractical (Flutter downloads its own deps).
;;;   3. Note: localsend-bin (binary variant) already exists as a
;;;      separate package in gaurix/packages/localsend-bin.scm and works.
;;; Blocker: MISSING_GUIX_DEPS (flutter, fvm, dart, rustup)
;;; Recommendation: Use localsend-bin instead; source build blocked
;;;   until Flutter toolchain is packaged for Guix.

;;; ────────────────────────────────────────────
;;; appimagelauncher — BLOCKED: MISSING_GUIX_DEPS
;;; ────────────────────────────────────────────
;;; AppImageLauncher requires libappimage which is not in Guix.
;;; The build also depends on lib32-glibc and lib32-gcc-libs (32-bit
;;; compatibility libraries) which Guix doesn't typically provide.
;;; Approaches tried:
;;;   1. Checked Guix for libappimage — not found.
;;;   2. Checked build deps: squashfuse (found), nlohmann-json (found),
;;;      argagg (found), but libappimage, libbsd (partial) are missing.
;;;   3. Considered packaging libappimage first, but it has its own deep
;;;      dependency tree (libappimageupdate, zsync2, etc.) and the
;;;      upstream build system uses FetchContent for many deps.
;;; Blocker: MISSING_GUIX_DEPS (libappimage, lib32-glibc, lib32-gcc-libs)
;;; Recommendation: Would require packaging libappimage and its full
;;;   dependency tree first. Large effort.
