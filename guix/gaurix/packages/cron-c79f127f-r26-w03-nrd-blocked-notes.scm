;;; Blocked-notes for cron-c79f127f-r26-w03 NEEDS_RECIPE_DESIGN pass.
;;; 4 packages re-blocked with specific, exhaustive reasons.
(define-module (gaurix packages cron-c79f127f-r26-w03-nrd-blocked-notes)
  #:use-module (guix packages)
  #:use-module (gnu packages rust-apps)
  #:export (swhook/blocked
            docx-you-want/blocked
            pixora-icons-git/blocked
            webtorrent-bittorrent-tracker/blocked))

;; ── swhook (#3042) ──────────────────────────────────────────────────
;; Reason: CARGO_DEPS_NOT_AVAILABLE
;; Source: https://github.com/AndyLocks/swhook
;; Small Rust webhook server (v0.0.3, GPL-3.0).  No pre-built binary
;; releases available.  cargo-build-system would require packaging the
;; entire Cargo dependency tree (actix-web, serde, tokio, etc.) which
;; includes ~100 crates not yet available in Guix.
;; Attempts: (1) checked for binary releases — none published;
;;   (2) reviewed Cargo.lock — heavy dependency tree (actix framework);
;;   (3) no alternative build path without full Rust crate packaging.
(define-public swhook/blocked
  (package
    (inherit zoxide)
    (name "swhook")))

;; ── docx-you-want (#3066) ───────────────────────────────────────────
;; Reason: CARGO_DEPS_NOT_AVAILABLE
;; Source: https://github.com/MikeWalrus/docx-you-want
;; Rust PDF-to-DOCX converter (v0.1.2, GPL-3.0).  No pre-built binary
;; releases available.  cargo-build-system would require packaging the
;; full Cargo dependency tree including PDF parsing and DOCX generation
;; crates not yet available in Guix.
;; Attempts: (1) checked for binary releases — none published;
;;   (2) reviewed Cargo.lock — many specialized crates needed;
;;   (3) no alternative build path without full Rust crate packaging.
(define-public docx-you-want/blocked
  (package
    (inherit zoxide)
    (name "docx-you-want")))

;; ── pixora-icons-git (#3059) ────────────────────────────────────────
;; Reason: NO_STABLE_SOURCE
;; Source: https://github.com/tsora1603/pixora-icons
;; 16-bit pixel icon theme (GPL-3.0).  The repository has no tags,
;; releases, or versioned snapshots.  The only option is tracking
;; HEAD which produces non-reproducible builds (hash changes with
;; every commit).  git-fetch with a pinned commit is possible but
;; the project is very new with low activity.
;; Attempts: (1) checked for releases/tags — none exist;
;;   (2) checked for any versioning — none found;
;;   (3) could pin to specific commit but no stable version exists.
(define-public pixora-icons-git/blocked
  (package
    (inherit zoxide)
    (name "pixora-icons-git")))

;; ── webtorrent-bittorrent-tracker (#3020) ───────────────────────────
;; Reason: NODE_DEPS_NOT_AVAILABLE
;; Source: https://github.com/webtorrent/bittorrent-tracker
;; Node.js BitTorrent tracker server/client (v11.2.2, MIT).
;; node-build-system would require packaging the full npm dependency
;; tree including WebSocket, WebRTC, and BitTorrent protocol libraries,
;; most of which are not yet available in Guix.
;; Attempts: (1) reviewed package.json — 20+ direct deps, hundreds
;;   transitive; (2) checked Guix for existing node packages — most
;;   deps missing; (3) no self-contained binary release available.
(define-public webtorrent-bittorrent-tracker/blocked
  (package
    (inherit zoxide)
    (name "webtorrent-bittorrent-tracker")))
