;;; Round-22 worker-03 NEEDS_RECIPE_DESIGN resolution pass #10 — blocked notes.
;;; 1 package re-blocked from 100 attempted.

(define-module (gaurix packages cron-c79f127f-r22-w03-nrd10-blocked-notes))

;;; ── Re-blocked packages ─────────────────────────────────────────

;; 10104. remarshal
;; Blocker: DEP_RESOLUTION_FAILED
;; Detail: remarshal v0.17.1 (Python, Poetry/pyproject build) requires
;;   python-u-msgpack-python (>=2.6, <3.0) which is not packaged in Guix.
;;   python-msgpack exists but is a different library (C extension based).
;;   Also needs python-tomlkit constrained to >=0.7,<0.8 (Guix has 0.13.3,
;;   which may be incompatible).
;; Next action: Package python-u-msgpack-python first, then verify
;;   tomlkit API compatibility, then revisit remarshal recipe.
