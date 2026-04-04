;;; Blocked notes for blocked-tree run cron-c79f127f round 8 worker w03.
(define-module (gaurix packages cron-c79f127f-r8-w03-blocked-notes)
  #:export (cron-c79f127f-r8-w03-blocked-notes))

(define cron-c79f127f-r8-w03-blocked-notes
  (list
   (list "mdcat" "EXCESSIVE_RUST_CRATE_DEPENDENCIES"
         "A1: guix show mdcat and guix search mdcat return no upstream Guix package."
         "A2: source archive analysis reveals Cargo.lock with 283 crate dependencies required for cargo-build-system packaging."
         "A3: Guix cargo-build-system requires explicit declaration of every crate input; 283 crates is infeasible for a single worker chunk without a dedicated Rust crate packaging pass.")))
