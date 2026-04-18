;;; GNU Guix --- Functional package management for GNU
;;; Copyright (C) 2026 Gaurix Contributors
;;;
;;; Recipe resolver pass --- recipe-resolver-260418af
;;; Resolves 30 NEEDS_RECIPE_DESIGN packages.
;;;
;;; This pass reconciles stale NEEDS_RECIPE_DESIGN statuses with existing
;;; recipes from prior resolver and deptree passes.
;;;
;;; New recipes (0):
;;;   (none — all resolvable packages already have recipes)
;;;
;;; ALREADY_PACKAGED_PRIOR (23):
;;;       1.  ccase -> recipe in recipe-resolver-260413ae.scm
;;;       2.  brother-mfc-l2710dw -> recipe in recipe-resolver-260414g.scm
;;;       3.  time-desktop-bin -> recipe in queue-20260402p100daily4.scm
;;;       4.  zectl-pacman-hook -> recipe in deptree-resolver-260413f.scm
;;;       5.  kemulatornnmod-bin -> recipe in queue-20260325p100.scm
;;;       6.  naviterm-bin -> recipe in queue-20260325p100.scm
;;;       7.  python-ghlang -> recipe in queue-20260325p100c.scm
;;;       8.  pyradio -> recipe in queue-20260325p100c.scm
;;;       9.  doasedit-nhk -> recipe in deptree-resolver-260413l.scm
;;;      10.  systemd-liberated-git -> recipe in queue-20260329p100.scm
;;;      11.  systemd-liberated-resolvconf-git -> recipe in queue-20260329p100.scm
;;;      12.  systemd-liberated-sysvcompat-git -> recipe in queue-20260329p100.scm
;;;      13.  systemd-liberated-tests-git -> recipe in queue-20260329p100.scm
;;;      14.  systemd-liberated-ukify-git -> recipe in queue-20260329p100.scm
;;;      15.  kdesu5 -> recipe in cron-c79f127f-r22-w03-nrd4.scm
;;;      16.  local-by-flywheel-bin -> recipe in recipe-resolver-260417ap.scm
;;;      17.  anycubicslicernext-bin -> recipe in recipe-resolver-260413y.scm
;;;      18.  cpp-jwt -> recipe in cron-c79f127f-w02.scm
;;;      19.  tonespace -> recipe in deptree-resolver-260408h.scm
;;;      20.  crandpass -> recipe in deptree-resolver-260408i.scm
;;;      21.  unraid-usb-creator-bin -> recipe in deptree-resolver-260413f.scm
;;;      22.  anytype-alpha-bin -> recipe in recipe-resolver-260413y.scm
;;;      23.  burpsuite -> recipe in recipe-resolver-260413ae.scm
;;;
;;; ALREADY_PACKAGED_IN_GUIX (1):
;;;      24.  haskell-nats -> ghc-nats exists in Guix (gnu/packages/haskell-xyz.scm)
;;;
;;; BLOCKED EXHAUSTED (6):
;;;      25.  qfinderpro-bin -> PROPRIETARY_CUSTOM_LICENSE: QNAP proprietary utility
;;;      26.  pexip-infinity-connect-bin -> PROPRIETARY_CUSTOM_LICENSE: Pexip commercial app
;;;      27.  aura-bin -> ARCH_SPECIFIC: AUR helper requires pacman/libalpm
;;;      28.  electron32-bin -> ELECTRON_COMPLEX: Electron runtime 200+ deps
;;;      29.  mqtt-explorer-beta -> NON_FREE_LICENSE: CC-BY-ND does not allow modifications
;;;      30.  napcatqq-git -> PROPRIETARY_DEPS: requires linuxqq (Tencent proprietary)
;;;
;;; NOTE: No new sha256 hashes needed (no new recipes).

(define-module (gaurix packages recipe-resolver-260418af)
  #:use-module (guix packages))

;;; This module contains no new package definitions.
;;; All 30 evaluated packages were resolved as ALREADY_PACKAGED_PRIOR
;;; (existing recipes in prior passes) or BLOCKED EXHAUSTED.
;;; See recipe-resolver-260418af-blocked-notes.scm for details.
