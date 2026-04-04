;;; Blocked notes for cron-c79f127f-r15 worker w02.
;;; All 10 packages RESOLVED or ALREADY_DONE.
;;;
;;; ALREADY_DONE (pass dry-run from other modules):
;;;   - xlibre-xserver-common-git (from cron-c79f127f-r8-w02, queue-20260330p100daily)
;;;   - python-munge (from cron-c79f127f-r8-w02, cron-c79f127f-w03)
;;;   - sqlite-utils (from cron-c79f127f-r8-w02)
;;;   - xrizer-common (from cron-c79f127f-r8-w02, cron-c79f127f-w03)
;;;   - tailscale (from cron-c79f127f-r8-w02, cron-5a2fb251-recipe-w03, cron-c79f127f-w10)
;;;   - python-plyer (from queue-20260325p100b, cron-c79f127f-w05, cron-c79f127f-r8-w03)
;;;
;;; RESOLVED (re-defined in cron-c79f127f-r15-w02.scm to fix discovery):
;;;   - python-art: Previously defined in cron-c79f127f-r8-w02 and cron-c79f127f-w02
;;;     but could not be found by `guix build -n` due to broken sibling modules
;;;     (stellarium unbound variable in general-compat.scm, etc.).
;;;     Re-defined here as self-contained recipe. Passes dry-run.
;;;   - flaresolverr: Same discovery issue. Re-defined as trivial repackage.
;;;   - chexquest3-wad: Same discovery issue. Re-defined as trivial WAD unpack.
;;;   - square1-wad: Same discovery issue. Re-defined as trivial PK3 unpack.
;;;
;;; ROOT CAUSE: Guix's package scanner encounters errors in other modules
;;; (general-compat.scm missing (gnu packages astronomy) import for stellarium,
;;; queue-20260401p100daily8 missing, etc.) which prevents it from finding
;;; packages in modules that load later in alphabetical order.
