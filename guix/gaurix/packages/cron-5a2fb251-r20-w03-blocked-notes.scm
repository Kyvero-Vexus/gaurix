;;; Blocked notes for round 20, worker 03
;;; 4 packages remain BLOCKED:
(define-module (gaurix packages cron-5a2fb251-r20-w03-blocked-notes)
  #:use-module (guix packages))

;; 1. udiskr — BLOCKED: MISSING_BUILD_TOOLS
;;    Reason: Requires cargo-nightly (nightly Rust toolchain) with -Zbuild-std-features=
;;    which is an unstable feature not available in Guix's stable Rust.
;;    Guix only provides stable Rust (1.85.x). No binary releases available.
;;    Tried: Checked for release binaries (none), checked if standard cargo works
;;    (PKGBUILD explicitly requires cargo-nightly and -Z flags).

;; 2. docx-you-want — BLOCKED: MISSING_GUIX_DEPS
;;    Reason: Rust source package requiring cargo-build-system with all crate
;;    dependencies individually packaged. The Cargo.lock would need dozens of
;;    Rust crate packages to be created. Also requires inkscape as a runtime dep.
;;    Tried: Checked for pre-built binaries (none exist), examined build requirements.

;; 3. tilem-gtk3-git — BLOCKED: COMPLEX_SOURCE_BUILD
;;    Reason: C source package using autotools (configure/make) that depends on
;;    libticalcs2 (available in Guix) and gtk3, but the build system requires
;;    careful integration with the Guix gnu-build-system and the project has no
;;    tagged releases (only git commits). Build would need testing beyond dry-run.
;;    Tried: Examined source structure, confirmed deps are available.

;; 4. mkbrr-gui-bin — BLOCKED: MISSING_GUIX_DEPS
;;    Reason: Pre-built binary links against 100+ shared libraries including
;;    webkitgtk-4.1, libsoup3, GTK3, GStreamer, and many more. Building an rpath
;;    that covers all these transitive dependencies is extremely fragile.
;;    The binary expects a full desktop environment's worth of shared libraries.
;;    Tried: Listed all ldd dependencies (130+ .so files), assessed patchelf feasibility.
